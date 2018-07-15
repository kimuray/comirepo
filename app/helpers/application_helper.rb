module ApplicationHelper
  def default_meta_tags
    {
      site: 'まんがのおばけ',
      title: 'まんがのおばけ',
      reverse: true,
      charset: 'utf-8',
      description: '漫画の感想をフォロワーに向けて発信するサービスです。漫画は他人と感想を共有してこそ面白い！',
      keywords: '漫画,コミック,感想',
      canonical: request.original_url,
      separator: '|',
      icon: [
         { href: image_url('/favicon.ico') },
      #   { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'まんがのおばけ',
        title: 'まんがのおばけ',
        description: '漫画の感想をフォロワーに向けて発信するサービスです。漫画は他人と感想を共有してこそ面白い！',
        type: 'website',
        url: request.original_url,
        image: image_url('/ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
      }
    }
  end
end
