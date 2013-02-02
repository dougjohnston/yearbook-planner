class Subdomain
  def self.matches?(request)
    if request.host =~ /localhost/ and Rails.env == 'development'
      true
    else
      request.subdomain.present? && request.subdomain != 'www'
    end
  end
end
