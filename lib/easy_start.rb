require "easy_start/version"
require 'active_support/all'

module EasyStart
  def self.add(project)
		base_data = {'project_name' => '', 'project_path' => ''}		
		base_data.each do |key,value|	
			loop do 
				base_data[key] = project[key]
				unless base_data[key].present?
					puts "Enter #{key}"
					input = gets.chomp
					base_data[key] = input					
				end
				break if base_data[key].present?
			end
		end
		create_script base_data
	end

	def self.create_script base_data
		create_directory_if_not_found	
		file_path = File.join(File.dirname(__FILE__), "../scripts/#{base_data['project_name']}.sh")
		File.open(file_path, 'w') {|f| f.write("ROOT_PATH=\"#{base_data['project_path']}\"\n" + meta_data) }
		system "chmod 755 #{file_path}"
	end

	def self.create_directory_if_not_found
		directory_path = File.join(File.dirname(__FILE__), "../scripts")
		unless File.directory?(directory_path)
			Dir.mkdir directory_path
		end
	end

	def self.launch(launch_data,branch='')		
		name = launch_data.respond_to?(:keys) ? launch_data['launch_project_name'] : launch_data
		port = launch_data['project_port'] || '3000'
		branch = launch_data['project_branch'] || branch
		begin
			file_path = File.join(File.dirname(__FILE__), "../scripts/#{name}.sh")
			a = system "#{file_path}", port ,(branch || '') 
		rescue SystemExit, Interrupt
			exit 0
		rescue Exception => e
		  puts e
		end	
	end

	def self.launch_console(name)
		root_path = get_root_path(name)
		system "cd #{root_path} && rails c" 
	end

	def self.meta_data
		['cd "$ROOT_PATH"','if [ -n "$2" ]; then','git checkout $2','git pull','fi','rails s -p $1'].join("\n")
	end

	def self.get_root_path(name)
		root_path = ""
		file_path = File.join(File.dirname(__FILE__), "../scripts/#{name}.sh")
		File.open(file_path).each do |line|
			if line.include? 'ROOT_PATH='
				line.slice!("ROOT_PATH=\"")
				line.slice!("\"\n")
				root_path = line
				break
			end
		end
		root_path
	end

end
