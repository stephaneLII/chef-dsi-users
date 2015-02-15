require 'rubygems'
require 'highline/import'
require 'unix_crypt'
require 'securerandom'

desc 'Generate an encrypt password'
task :password do
  p1 = ask('Password: ') do |q|
    q.echo = false
  end

  p2 = ask('Confirm: ') do |q|
    q.echo = false
    q.validate = /^#{p1}$/
  end

  puts
  fail 'passwords do not match' unless p1 == p2

  if p1.length == 0
    p1 = SecureRandom.hex
    puts 'You did not enter a password, generating one for you:'
    puts
    puts "    #{p1}"
    puts
  end

  salt = SecureRandom.hex(1)
  printf "DES : %s\n", UnixCrypt::DES.build(p1, salt)
  salt = SecureRandom.hex(4)
  printf "MD5 : %s\n", UnixCrypt::MD5.build(p1, salt)
  salt = SecureRandom.hex(8)
  printf "SHA256 : %s\n", UnixCrypt::SHA256.build(p1, salt)
  printf "SHA512 : %s\n", UnixCrypt::SHA512.build(p1, salt)
end
