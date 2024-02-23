---
- name: Lister les fichiers dans un répertoire spécifique
  hosts: infomaniak
  tasks:
    - name: Lister les fichiers dans /sites/m.digitalstories.com
      ansible.builtin.shell: php-8.0 /sites/m.digitalstories.com/cron.php
      register: result

    - name: Afficher les résultats
      ansible.builtin.debug:
        msg: "{{ result.stdout_lines }}"
