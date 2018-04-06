use_helper Nanoc::Helpers::Blogging
use_helper Nanoc::Helpers::LinkTo
use_helper Nanoc::Helpers::Rendering
use_helper Nanoc::Helpers::Tagging
use_helper Nanoc::Helpers::XMLSitemap

def fingerprint(pattern)
  contents = @items.find_all(pattern).map do |i|
    i.binary? ? File.read(i[:filename]) : i.raw_content
  end
  Digest::SHA1.hexdigest(contents.join(''))[0..5]
end

def format_date(date_str, format='%Y-%m-%d')
  DateTime.parse(date_str).strftime(format)
end

def date_to_xmlschema(date_str)
  DateTime.parse(date_str).xmlschema
end
