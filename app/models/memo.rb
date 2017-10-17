class Memo < ActiveRecord::Base
    validates :title, presence: true, length: {minimum: 3, message:'タイトルは４文字以上で入力してください'}
    validates :body, presence: true
end
