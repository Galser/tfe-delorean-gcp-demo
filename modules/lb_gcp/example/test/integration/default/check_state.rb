describe command('terraform state list') do
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end
