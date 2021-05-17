module ApplicationHelper

  def full_title(page_name = "")
    @base_title = "商品・サービス紹介サイト"
    if page_name.empty?
      @base_title
    else
      page_name + " | " + @base_title
    end
  end

  def embedded_svg filename, options={}
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end
end