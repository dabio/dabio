class ByExtension < Nanoc::Filter
  identifier :by_extension
  type :text

  def filter_mapping(filter_id)
    case filter_id
    when :md
      :redcarpet
    when :html
      :erb
    else
      filter_id
    end
  end

  def run(content, params={})
    filter_id, options = assigns[:layout][:filter] || assigns[:layout][:extension]
    filter_id = filter_mapping(filter_id.to_sym)

    filter = Nanoc::Filter.named(filter_id)
    if filter.nil? or filter.from_binary? or filter.to_binary?
      raise Nanoc::Errors::CannotDetermineFilter.new(filter_id)
    end

    filter.new(@assigns).run(content, params.fetch(filter_id, {}).merge(options || {}))
  end

end
