require 'rails_helper'

RSpec.describe ArticleForm, type: :model do
  before do
    @article_form = FactoryBot.build(:article_form)
  end

  describe '記事投稿機能' do
    context '投稿できる場合' do
      it 'theme, issue, measure, result, tag_nameが正しく入力されており、imageが添付されていれば投稿できる' do
        expect(@article_form).to be_valid
      end
      it 'tag_nameは空でも登録できる' do
        @article_form.tag_name = ''
        expect(@article_form).to be_valid
      end
      it 'imageはなくても登録できる' do
        @article_form.image = nil
        expect(@article_form).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'themeが空では登録できない' do
        @article_form.theme = ''
        @article_form.valid?
        expect(@article_form.errors.full_messages).to include("Theme can't be blank")
      end
      it 'issueが空では登録できない' do
        @article_form.issue = ''
        @article_form.valid?
        expect(@article_form.errors.full_messages).to include("Issue can't be blank")
      end
      it 'measureが空では登録できない' do
        @article_form.measure = ''
        @article_form.valid?
        expect(@article_form.errors.full_messages).to include("Measure can't be blank")
      end
      it 'resultが空では登録できない' do
        @article_form.result = ''
        @article_form.valid?
        expect(@article_form.errors.full_messages).to include("Result can't be blank")
      end
      it 'userが紐づいていないと登録できない' do
        @article_form.user_id = nil
        @article_form.valid?
        expect(@article_form.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
