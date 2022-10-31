require 'yaml'
require 'fileutils'

FileUtils.rm Dir.glob('blog/tags/*.html')

tags = YAML.load_file('_data/tags.yml')
tags.each { |tag| 
    name = tag[0]
    title = tag[1]['title']
    description = tag[1]['description']
    icon = tag[1]['icon']
    
    result = {}
    result['layout']= 'tags'
    result['tag']= name
    result['title']= title
    result['description']= description
    if !icon.to_s.empty?
        result['icon'] = icon
    end

    File.open("blog/tags/#{name}.html", "w") { |file|
        file.write(result.to_yaml)
        file.write('---')
    }
}