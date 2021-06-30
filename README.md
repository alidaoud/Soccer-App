# Soccer App

Get the live football scores, results & fixtures over all leagues.

## Getting Started

Soccer App is a Mobile application that provides the current live matches and their details among all leagues and displays the fixtures of a specific league for a selected season and give some statistics for each fixture.

You can download Soccer App from 
<a target="_blank" href="https://play.google.com/store/apps/details?id=com.dvamd.soccerapp">Play Store</a> for android devices.


## System requirements

To install and run Flutter, your development environment must meet these minimum requirements:

### Windows install

- <b>Operating Systems:</b> Windows 7 SP1 or later (64-bit), x86-64 based.
- <b>Disk Space:</b> 1.64 GB (does not include disk space for IDE/tools).
- <b>Tools:</b> Flutter depends on these tools being available in your environment.
   * <a target="_blank" href="https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell">Windows PowerShell 5.0</a> or newer (this is pre-installed with Windows 10)
   * <a target="_blank" href="https://git-scm.com/download/win">Git for Windows</a> 2.x, with the Use Git from the Windows Command Prompt option.

If Git for Windows is already installed, make sure you can run git commands from the command prompt or PowerShell.

### Mac install

- <b>Operating Systems:</b> macOS (64-bit)
- <b>Disk Space:</b> 2.8 GB (does not include disk space for IDE/tools).
- <b>Tools:</b> Flutter uses git for installation and upgrade. We recommend installing <a target="_blank" href="https://developer.apple.com/xcode/">Xcode</a>, which includes git, but you can also <a target="_blank" href="https://git-scm.com/download/mac">install git separately</a>.


### Linux 

- <b>Operating Systems:</b> Linux (64-bit)
- <b>Disk Space:</b> 600 MB (does not include disk space for IDE/tools).
- <b>Tools:</b> Flutter depends on these command-line tools being available in your environment.
  * bash
  * curl
  * file
  * git 2.x
  * mkdir
  * rm
  * unzip
  * which
  * xz-utils
  * zip
- <b>Shared libraries:</b> Flutter test command depends on this library being available in your environment.
- libGLU.so.1 - provided by mesa packages such as libglu1-mesa on Ubuntu/Debian and mesa-libGLU on Fedora.


### Chrome OS

- <b>Operating Systems:</b> Chrome OS (64-bit) with Linux (Beta) turned on
- <b>Disk Space:</b> 600 MB (does not include disk space for IDE/tools).
- <b>Tools:</b> Flutter depends on these command-line tools being available in your environment.
  * bash
  * curl
  * git 2.x
  * mkdir
  * rm
  * unzip
  * which
  * xz-utils
- <b>Shared libraries:</b> Flutter test command depends on this library being available in your environment.
- libGLU.so.1 - provided by mesa packages such as libglu1-mesa on Ubuntu/Debian


## App Screenshots 

### Home Screen 


<table style="width:100%">
  <tr>
    <th>Home Screen - No live matches</th>
    <th>Home Screen - Available live matches</th>   
  </tr>
  <tr>
    <td>
     <img width="482" alt="Screen Shot 2021-06-25 at 19 01 31" src="https://user-images.githubusercontent.com/38518048/124003118-3c727300-d9df-11eb-86fc-24d955f12a08.png">
    </td>
    <td>
      <img width="482" alt="Screen Shot 2021-06-25 at 18 57 15" src="https://user-images.githubusercontent.com/38518048/124003464-a3902780-d9df-11eb-8c7c-70391b8000ad.png">
    </td>    
  </tr>  
</table>


### Live Match Details

<img width="482" alt="Screen Shot 2021-06-25 at 18 57 23" src="https://user-images.githubusercontent.com/38518048/124003243-6035b900-d9df-11eb-9a83-828fb3314d4f.png">


### League Fixture

<table style="width:100%">
  <tr>
    <th>Premier League Fixtures</th>
    <th>Bundesliga Fixtures</th>   
  </tr>
  <tr>
    <td>
       <img width="482" alt="Screen Shot 2021-06-30 at 20 26 29" src="https://user-images.githubusercontent.com/38518048/124005201-79d80000-d9e1-11eb-9468-0ced004a01f0.png">
    </td>
    <td>
      <img width="482" alt="Screen Shot 2021-06-30 at 20 26 18" src="https://user-images.githubusercontent.com/38518048/124024464-e6f69000-d9f7-11eb-8877-05dbed64e932.png">
    </td>    
  </tr>  
</table>


### Fixture Statistics

<img width="482" alt="Screen Shot 2021-06-25 at 18 57 46" src="https://user-images.githubusercontent.com/38518048/124003334-7a6f9700-d9df-11eb-9013-1f7d2e6cfe01.png">


## RESTFUL API 

<img width="1440" alt="Screen Shot 2021-06-30 at 23 25 39" src="https://user-images.githubusercontent.com/38518048/124027990-27580d00-d9fc-11eb-99c4-f9cb6a787b55.png">


This app uses API-FOOTBALL to fetch its data. <br/><br/>
<a target="_blank" href="https://www.api-football.com/">API-FOOTBALL:</a> is a RESTFUL API for all sports data ( FOOTBALL | BASKETBALL | BASEBALL | FORMULA-1 | HOCKEY | RUGBY )
