require 'net/http'
require 'json'
require 'fileutils'
require 'rugged'

FP_TABLE_FILE='fp-lib-table'.freeze
FPLIBTABLESTRING='(fp_lib_table'.freeze

reposit = Rugged::Repository.discover


if File.exists? FP_TABLE_FILE
  FileUtils.mv "#{FP_TABLE_FILE}", "#{FP_TABLE_FILE}.bak"
end

File.open(FP_TABLE_FILE, "w") do |f|
   f.puts FPLIBTABLESTRING
end

File.open(FP_TABLE_FILE, "a") do |f|
  url = "https://api.github.com/orgs/kicad/repos?page=1&per_page=100"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.load(response).each do |repo|
    if repo["name"].include?(".pretty")
      line = repo["clone_url"]
      name = "modules/#{repo["name"]}"
      basename = repo["name"].gsub(".pretty", "")
      if (reposit.submodules[name].nil? == true)
        reposit.submodules.add(line, name)
        puts "Added #{name}"
      end
      f.puts "  (lib (name #{basename})(type KiCad)(uri ${KISYSMOD}/#{name})(options \"\")(descr \"The way you like them.\"))"
    end
  end
  f.puts ")"
end

# if File.exists? "#{FP_TABLE_FILE}.bak"
#   to_append = File.read "#{FP_TABLE_FILE}"
#   to_append += File.read "#{FP_TABLE_FILE}.bak"
#   to_appendmew = to_append.gsub("(fp_lib_table"+'\n', "")
#   to_append = to_appendmew.gsub('\n'+")", "")
#   File.open(FP_TABLE_FILE, "w") do |f|
#     f.puts to_appendmew.lines.sort.uniq
#   end


# end