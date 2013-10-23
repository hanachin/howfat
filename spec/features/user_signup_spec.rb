require 'spec_helper'

feature 'ユーザーとして、サインアップし、体重晒しサービスを使いたい' do
  let(:nickname) { 'hanachin' }

  shared_context 'Fitbitの認証に成功する', fitbit: true do
    OmniAuth.config.mock_auth[:fitbit] = OmniAuth::AuthHash.new({
      provider: 'fitbit',
      uid:      '123545',
      info: {
        nickname: nickname
      }
    })
  end

  scenario 'トップページを訪れ、Fitbitで認証し、サインアップする', fitbit: true do
    visit root_path
    click_on 'Fitbitでサインアップ'
    expect(page).to have_text nickname
  end
end
