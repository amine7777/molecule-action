# molecule-action

This action helps you to use molecule tool for testing Ansible roles.

# Usage 
Since github clone the project in /github/workspace you need to include your role by calling 
***MOLECULE_PROJECT_DIRECTORY*** in converge.yml

```yaml
- name: Include role
  include_role:
    name: "{{ lookup('env', 'MOLECULE_PROJECT_DIRECTORY') | basename }}"

```

# Inputs
```yaml
  command:
    description: Command to pass to molecule
    required: true
    default: molecule converge -s default
 
  working_dir:
    description: |
        Path to another directory in the repository, where molecule command will be issued from.
        Useful in those cases where Ansible roles are not in git repository root.
    required: false
    default: ${{ github.repository }}
```

# Example

```yaml
on: [push]

jobs:
  molecule:
    runs-on: ubuntu-latest
    name: molecule 
    steps:
    - name: Check out the codebase.
      uses: actions/checkout@v2

    - name: Create a scenario
      uses: amine7777/molecule-action@v1
      with:
        command: molecule init scenario
      env:
        PY_COLORS: '1'
        ANSIBLE_FORCE_COLOR: '1'


    - name: molecule test
      uses: amine7777/molecule-action@v1
      with:
        command: molecule test  
      env:
        PY_COLORS: '1'
        ANSIBLE_FORCE_COLOR: '1'
```
