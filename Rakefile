require 'aws/s3'
require 'yaml'
$KCODE = 'UTF8'
require 'ya2yaml'

AWS::S3::Base.establish_connection!(
  :access_key_id => ENV['AMAZON_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AMAZON_SECRET_ACCESS_KEY']
)
include AWS::S3

def file_changed(f)
  if !MrBucket.exists?(f)
    return true
  end
  local_time = open(f).mtime
  live_time = Time.parse(MrBucket.find(f).about[:"last-modified"])
  return local_time > live_time
end

namespace :site do
  task :rebuild do
    a = []
    Dir["views/articles/*.markdown"].each do |f|
      article = File.read(f).split("---\n")
      meta = YAML::load(article[0])
      a.push({
        :title => meta['title'],
        :published => meta['published'],
        :slug => "/articles/" << File.basename(f, ".markdown")
      })
      puts "indexing #{File.basename(f)}"
    end
    puts "#{a.count} articles indexed"
    File.open("views/articles/_structure.yaml", 'w') {
      |f| f.write a.sort_by{|a| a[:published]}.reverse.ya2yaml
    }
  end
  task :upload do
    class MrBucket < AWS::S3::S3Object
        set_current_bucket_to 'camerondaigle'
    end
    tally = 0
    Dir.chdir("image_cache") do
      Dir["**/*.{jpg,gif,png}"].each do |f|
        if file_changed(f)
          puts "updating #{f}"
          MrBucket.store("#{f}", open(f), :access => :public_read)
          tally += 1
        end
      end
    end
    puts "#{tally} files uploaded"
  end
  task :init do
    if !File.directory?('.s3_cache')
      Dir.mkdir '.s3_cache'
    end
  end
end
