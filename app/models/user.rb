class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :chatrooms, through: :messages, dependent: :destroy
  has_many :calendars, dependent: :destroy
  has_many :schedules, through: :calendars, dependent: :destroy
  has_many :subjects # for teachers
  has_many :classrooms
  # !Need to analyze how to do this type of assiociation first
  has_many :subjects_as_student, through: :classrooms, source: :subjects
end
