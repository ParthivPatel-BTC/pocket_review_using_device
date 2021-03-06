class Client < ActiveRecord::Base
  attr_accessible :business_name, :contact_person, :contact_number, :address, :company_representative,
                  :email_address, :sms_content, :thank_you_content, :company_logo, :directory_url, :active

  attr_accessible :client_urls_attributes

  validates_presence_of :business_name, :contact_person, :contact_number, :company_representative,
                        :email_address, :sms_content, :thank_you_content

  validates :email_address, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
    message: "address is invalid" }, unless: "email_address.blank?"
    has_attached_file :company_logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  has_many :client_urls
  accepts_nested_attributes_for :client_urls, :allow_destroy => true
end