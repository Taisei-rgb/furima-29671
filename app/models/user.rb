class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  # email情報はdeviseにデフォルトで入っているため不要

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, uniqueness: true,
  # format: { with: VALID_EMAIL_REGEX }

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates_format_of :password, with: VALID_PASSWORD_REGEX

  validates :birth_date, presence: true

  ZENKAKU_INPUT = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates :family_name, :first_name, presence: true,
                                       format: { with: ZENKAKU_INPUT }

  ZENKAKU_KANA_INPUT = /\A([ァ-ン]|ー)+\z/.freeze
  validates :family_name_kana, :first_name_kana, presence: true,
                                                 format: { with: ZENKAKU_KANA_INPUT }
end
