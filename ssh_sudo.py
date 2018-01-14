import ansible.constants as C
import ansible.plugins.connection.ssh as SSH
import pipes

class Connection (SSH.Connection):

    def __init__(self, play_context, *args, **kwargs):

        super (Connection, self).__init__(play_context, *args, **kwargs)        
        
        self._make_become_cmd = self._play_context.make_become_cmd
        self._play_context.make_become_cmd = self.make_become_cmd
        

    def make_become_cmd (self, cmd, executable = None):
      
        becomecmd = self._make_become_cmd(cmd, executable=None)

        if cmd.split('=')[0] == 'sudo':
            
            command = cmd.split('=')[1]
            exe = self._play_context.become_method
            flags = getattr(C, 'DEFAULT_%s_FLAGS' % self._play_context.become_method.upper(), None)
            prompt = self._play_context.prompt
            user = self._play_context.become_user
            success_key = self._play_context.success_key         

            sudocmd = '%s -k && setsid %s %s-p "%s" -u %s %s;' 'rc=$?; echo %s; exit $rc' % \
                      (exe, exe, flags.replace('-n',''), prompt, user, command, success_key)
 
            becomecmd = '$SHELL -c ' + pipes.quote (sudocmd)
       
        return (becomecmd)
