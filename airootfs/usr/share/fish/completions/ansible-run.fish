function __ansible_run_playbooks
    for file in /usr/share/ansible/playbooks/*.yaml
        echo (basename $file .yaml)
    end
end

complete -c ansible-run -f -a '(__ansible_run_playbooks)'
