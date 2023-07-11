require 'rails_helper'
RSpec.describe '/disorders' do
  describe 'GET /index' do
    it do
      get disorders_url, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let(:disorder) { create(:disorder) }

    it 'renders a successful response' do
      get disorder_url(disorder), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    let(:group) { create(:group) }
    let(:type) { create(:type) }
    let(:params) do
      {
        disorder: attributes_for(
          :disorder,
          type_id: type.id,
          group_id: group.id
        )
      }
    end
    let(:do_call) do
      post disorders_url, params: params, as: :json
    end

    it do
      do_call
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    let(:disorder) { create(:disorder) }
    let(:params) do
      { orpha_code: 2 }
    end
    let(:do_call) do
      patch disorder_url(disorder), params: params, as: :json
    end

    before { disorder }

    it do
      do_call
      expect(response).to be_successful
    end

    it do
      do_call
      expect(disorder.reload.orpha_code).to eq(2)
    end
  end

  describe 'DELETE /destroy' do
    let(:disorder) { create(:disorder) }
    let(:do_call) do
      delete disorder_url(disorder), as: :json
    end

    before { disorder }

    it do
      expect { do_call }.to change(Disorder, :count).by(-1)
    end

    it do
      do_call
      expect(response).to be_successful
    end
  end

  describe 'GET /with_hpo_ids' do
    let(:disorder) { create(:disorder, hpo: hpos) }
    let(:hpos) { create_list(:hpo, 3) }
    let(:params) { hpos.map(&:hpo_id) }
    let(:do_call) do
      get with_hpo_ids_path, params: params, as: :json
    end

    before { disorder }

    it do
      do_call
      expect(response.parsed_body)
        .to contain_exactly(disorder.as_json)
    end
  end
end
