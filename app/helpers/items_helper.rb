module ItemsHelper
  def render_with_tags(hashname)
    hashname.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/item/tag/#{word.delete("#")}"}.html_safe
  end
end
