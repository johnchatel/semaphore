---
- name: Lister les fichiers dans un répertoire spécifique
  hosts: infomaniak
  tasks:
    - name: Lister les fichiers dans /sites/m.digitalstories.com
      ansible.builtin.shell: ls /sites/m.digitalstories.com
      register: result

    - name: Afficher les résultats
      ansible.builtin.debug:
        msg: "{{ result.stdout_lines }}"
