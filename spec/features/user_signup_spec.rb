require 'spec_helper'

feature 'ユーザーとして、サインアップし、体重晒しサービスを使いたい' do
  let(:nickname) { 'hanachin' }

  shared_context 'Fitbitの認証に成功する', fitbit: true do
    before do
      OmniAuth.config.mock_auth[:fitbit] = OmniAuth::AuthHash.new({
        provider: 'fitbit',
        uid:      '123545',
        info: { nickname: nickname }
      })
    end
  end

  context 'はじめてのサインアップ', fitbit: true do
    scenario 'トップページを訪れ、Fitbitで認証し、サインアップする' do
      visit root_path
      click_on 'Fitbitでサインアップ'
      expect(page).to have_text nickname
    end
  end
end
