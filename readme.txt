+-- buildroot: directory is a clone of the clean buildroot repository
+-- output: will be populated by the outputs for the different board (one directory for each board)
     +-- board1
     +-- board2
     +...


+-- custom_layer
     +-- external_tree : this is the external tree with customisation for LibreOcean
        - external.desc
        - external.mk
        - Config.in
     +-- scripts: bunch of scripts used for LibreOcean specific tasks

- setenv.sh: initialise the PATH to access scripts directly and any additional environment variables defined.

