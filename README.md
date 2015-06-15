RcToolsX
================

Automated Installation Kit

<img src="https://img.shields.io/dub/l/vibe-d.svg" />

RcToolsX is a set of software installation aids, with command-line parameters and batch execution in two ways, built-in functions that allow you to create file, registry, Windows, desktop, system, service operations, and support the system environment variables and CMD command can be written directly without conversion.

<h2><a name="usage" class="anchor" href="#usage"><span class="mini-icon mini-icon-link"></span></a>Usage</h2>

Run from command line. For example:

```shell
Start /wait RcToolsX.exe /rc::readscript "Install\Test2.rcini"
Start /wait RcToolsX.exe /rc::readscript "Install\Test3.rcini"
```

The file <code>RcToolsX.rcini</code> is optional.

```shell
Start /wait RcToolsX.exe "RcToolsX.rcini"
```

<h2><a name="example" class="anchor" href="#example"><span class="mini-icon mini-icon-link"></span></a>Example</h2>

Create the automatically script in <code>RcToolsX.rcini</code>.

```shell
exf::msgbox,"Test3.rcini","RcToolsX 1.3",20,30
exf::beep,784,300
exf::beep,659,250
exf::beep,659,250
exf::beep,698,300
exf::beep,587,250
exf::beep,587,500
exf::beep,523,300
exf::beep,587,300
exf::beep,659,400
exf::beep,698,300
exf::beep,784,300
exf::beep,784,300
exf::beep,784,600
exf::beep,784,300
exf::beep,659,250
exf::beep,659,500
exf::beep,698,300
exf::beep,587,250
exf::beep,587,500
exf::beep,523,300
exf::beep,659,400
exf::beep,784,300
exf::beep,784,300
exf::beep,523,500
```

<h2><a name="changelog" class="anchor" href="#changelog"><span class="mini-icon mini-icon-link"></span></a>Changelog</h2>

<h4>1.3</h4/>
- Added Autoit 3.3.12.0 compiler supported. 
- Fixed some bugs.

<h2><a name="author" class="anchor" href="#author"><span class="mini-icon mini-icon-link"></span></a>Author</h2>
* 2008 rchockxm (rchockxm.silver@gmail.com)

<h2><a name="credits" class="anchor" href="#credits"><span class="mini-icon mini-icon-link"></span></a>Credits</h2>

* smashly - _ExtractIconToFile function.
