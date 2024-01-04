module ChunkyProjects
  def self.to_html(textile)
    if textile.encoding.name != "UTF-8"
      raise ChunkyProjects::EncodingError, "Textile encoding must be UTF-8"
    end
    if !textile.valid_encoding?
      raise ChunkyProjects::EncodingError, "Textile encoding must be valid UTF-8"
    end

    Internal.to_html(textile)
  end
end
