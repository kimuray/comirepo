module ApplicationHelper
  def default_meta_tags
    {
      site: 'comirepo',
      title: '漫画の感想投稿サービス',
      reverse: true,
      charset: 'utf-8',
      description: '漫画の感想をかけるサイトです',
      keywords: '漫画,コミック,感想',
      canonical: request.original_url,
      separator: '|',
      # icon: [
      #   { href: image_url('favicon.ico') },
      #   { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      # ],
      og: {
        site_name: 'comirepo',
        title: '漫画の感想投稿サービス',
        description: '漫画の感想が書けるサイトです',
        type: 'website',
        url: request.original_url,
        # image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
      }
    }
  end
end
