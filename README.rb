require 'rbconfig'

OSVERSION = RbConfig::CONFIG['host_os']
ARCH = RbConfig::CONFIG['arch']
HOSTCPU = RbConfig::CONFIG['host_cpu']
BUILDCPU = RbConfig::CONFIG['build_cpu']
TARGETCPU = RbConfig::CONFIG['target_cpu']

puts "OS: #{OSVERSION}"
puts "Arch: #{ARCH}"
puts "Host CPU: #{HOSTCPU}"
puts "Build CPU: #{BUILDCPU}"
puts "Target CPU: #{TARGETCPU}"