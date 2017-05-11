CallMap
------------------------------------------------------------

CallMap is a tiny tools to draw C-function call. 

### Usage

  Download newest branch from github
  ```
    git clone https://github.com/BiscuitOS/CallMap.git 
  ```

  Install tools.
  ```
    sudo chmod 755 INSTALL.sh
    sudo ./INSTALL.sh
  ```

  Configure CallMap
  ```
    vi /etc/CallMap/CallMap.conf
  ```
  
  Select source code tree.

     `SOURCE_TREE` point the path of source code tree.

     `BROWSER` means view will be used. 

  Start Use

     ```
       callmap function_name
       eg.
       callmap main
     ```

