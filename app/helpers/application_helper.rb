# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      site: 'Wisdom Whistle',
      title: 'Wisdom Whistle',
      reverse: true,
      charset: 'utf-8',
      description: '復習を通知するサービスです',
      canonical: request.original_url,
      og: {
        site_name: 'Wisdom Whistle',
        title: 'Wisdom Whistle',
        description: '復習を通知するサービスです',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp_image.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@',
        image: image_url('ogp_image.png')
      }
    }
  end

  def page_title(title = '')
    base_title = 'Wisdom Whistle'
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end
