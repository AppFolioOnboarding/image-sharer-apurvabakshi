class Image < ApplicationRecord
  acts_as_taggable_on :tags
  validates :url, presence: true
  validate :check_url

  private

  # added rucocop disable all to avoid Assignment Branch Condition error

  def check_url # rubocop:disable all
    return errors.add(:url, :blank) if url.blank?
    parsed_url = URI.parse(url)

    Net::HTTP.start(parsed_url.host, parsed_url.port, use_ssl: true) do |http|
      response = http.head(parsed_url.path)
      case response
      when Net::HTTPSuccess, Net::HTTPRedirection
        case response.content_type
        when 'image/png', 'image/gif', 'image/jpeg'
          break
        end
      else
        errors.add(:url, 'url is not valid')
      end
    end
  rescue OpenSSL::SSL::SSLError
    errors.add(:url, 'url is not valid')
  end
end
