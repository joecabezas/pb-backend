namespace :preload do
  desc 'Pre-process the input XML and store the output in DB'
  task parse: :environment do
    Disorder.destroy_all
    Hpo.destroy_all

    doc = File.open('en_product4.xml') { |f| Nokogiri::XML(f) }
    disorders = doc
                .xpath('//JDBOR/HPODisorderSetStatusList/HPODisorderSetStatus/Disorder')

    disorders.each do |disorder| # rubocop:disable Metrics/BlockLength
      id = disorder['id']
      orpha_code = disorder.xpath('OrphaCode').text
      expert_link = disorder.xpath('ExpertLink').text
      name = disorder.xpath('Name').text

      type = disorder.xpath('DisorderType')
      type_id = type.attr('id').value
      type_name = type.xpath('Name').text

      group = disorder.xpath('DisorderGroup')
      group_id = group.attr('id').value
      group_name = group.xpath('Name').text

      type = Type.find_or_initialize_by({ id: type_id, name: type_name })
      group = Group.find_or_initialize_by({ id: group_id, name: group_name })
      disorder_params = {
        id: id,
        orpha_code: orpha_code,
        expert_link: expert_link,
        name: name,
        type: type,
        group: group
      }
      puts "creating Disorder: #{disorder_params}"
      disorder_instance = Disorder.new(disorder_params)

      association_list_objects = disorder.xpath('HPODisorderAssociationList')
      association_list_objects.each do |association_list| # rubocop:disable Metrics/BlockLength
        association_list.xpath('HPODisorderAssociation').each do |association| # rubocop:disable Metrics/BlockLength
          hpo = association.xpath('HPO')
          id = hpo.attr('id').value

          # if HPO exists add it and continue
          hpo_instance = Hpo.find_by_id(id)
          if hpo_instance
            disorder_instance.hpo << hpo_instance
            next
          end

          hpo_id = hpo.xpath('HPOId').text
          hpo_term = hpo.xpath('HPOTerm').text

          frequency = association.xpath('HPOFrequency')
          frequency_id = frequency.attr('id').value
          frequency_name = frequency.xpath('Name').text

          frequency = Frequency.find_or_initialize_by(
            {
              id: frequency_id,
              name: frequency_name
            }
          )

          hpo_params = {
            id: id,
            hpo_id: hpo_id,
            term: hpo_term,
            frequency: frequency
          }
          puts "creating HPO: #{hpo_params}"
          hpo_instance = Hpo.create!(hpo_params)
          disorder_instance.hpo << hpo_instance
        end
      end

      disorder_instance.save!
    end
  end
end
