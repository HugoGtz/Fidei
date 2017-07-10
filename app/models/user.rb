class User < ActiveRecord::Base
  
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable
         
   validates :avatar,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 15.megabytes }

  has_attached_file :avatar,
    :storage => :cloudinary,
    :path => "avatar/:filename",
    :styles => {
      :thumb => '600x600>',
      :square => '800x800#',
      :medium => '1200x1200>'
    }
end
