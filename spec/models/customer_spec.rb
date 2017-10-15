require 'rails_helper'

describe Customer do
  it "有効なファクトリを持つこと" do
    expect(build(:customer)).to be_valid
  end

  it "姓/名/住所/電話/メール/誕生日/性別があれば有効な状態であること" do
    customer = Customer.new(
      first_name: '明日奈',
      last_name: '結城',
      address: '東京',
      phone: '08012345678',
      email: 'asuna@example.com',
      birthday: 20070930,
      gender: 'female'
    )
    expect(customer).to be_valid
  end

  it "名がなければ無効な状態であること" do
    customer = build(:customer, first_name: nil)
    customer.valid?
    expect(customer.errors[:first_name]).to include("can't be blank")
  end

  it "姓がなければ無効な状態であること" do
    customer = build(:customer, last_name: nil)
    customer.valid?
    expect(customer.errors[:last_name]).to include("can't be blank")
  end

  it "メールがなければ無効な状態であること" do
    customer = build(:customer, email: nil)
    customer.valid?
    expect(customer.errors[:email]).to include("can't be blank")
  end

  it "重複したメールアドレスなら無効な状態であること" do
    create(:customer, email: 'kirito@example.com')
    customer = build(:customer, email: 'kirito@example.com')
    customer.valid?
    expect(customer.errors[:email]).to include('has already been taken')
  end

  it "連絡先のフルネームを文字列として返すこと" do
    customer = build(:customer,
      first_name: '和人',
      last_name: '桐ヶ谷',
    )
    expect(customer.full_name).to eq '和人 桐ヶ谷'
  end

  describe "文字で姓をフィルタする" do
    before :each do
      @smith = Customer.create(
        first_name: 'Jhon',
        last_name: 'Smith',
        address: '世田谷',
        phone: '08012345678',
        email: 'smith@example.com',
        birthday: 19870930,
        gender: 'female',
      )
      @jones = Customer.create(
        first_name: 'Tim',
        last_name: 'Jones',
        address: 'sh処i暑oo',
        phone: '08012456712',
        email: 'jones@example.com',
        birthday: 19970930,
        gender: 'female',
      )
      @johnson = Customer.create(
        first_name: 'Jon',
        last_name: 'Jhonson',
        address: '東京',
        phone: '08012393748',
        email: 'jhonson@example.com',
        birthday: 20000930,
        gender: 'female',
      )
    end

    context "マッチする文字の場合" do
      it "マッチした結果をソート済みの配列として返すこと" do
        expect(Customer.by_letter("J")).to eq [@johnson, @jones]
      end
    end

    context "マッチしない文字の場合" do
      it "マッチしなかったものは結果に含まれないこと" do
        expect(Customer.by_letter("J")).not_to include @smith
      end
    end
  end
end
