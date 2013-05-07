/**
 * The master list of tutorials.  If you add a tutorial, add it here!
 */
function tutorialNames() {
  return {
		"fib1":"t0",
		"ftoc":"t1",
		"exponent":"t2",
		"nocaps":"t3",
		"copyscores":"t4",
		"octtoint":"t5",
		"fib2":"t6",
		"fib3":"t7",
		"handler1":"t8",
		"dotprod1":"t9",
		"doubletosingle":"ta",
		"handler2":"tb",
		"dotprod2":"tc",
		"dotprod3":"td",
	};
}

/**
 * The same list, indexed 0..N
 */
function tutorialNames2() {
	var t1 = tutorialNames();
	var t2 = new Array();
	var i = 0;
	for (var n in t1) {
    t2[i] = t1[n];
		i++;
  }
	return t2;
}

function isATutorial(dir) {
	var t = tutorialNames();
	for (var i in t) {
    if(dir == t[i]) {
      return true;
    }
  }
  return false;
}

/**
 * Finds "tutorial" in the http://path/to/this/.../file
 */
function tutorialRoot() {
  var path = String(document.location).split("/");
  var rs = '';
	for(var i = path.length - 2; i > 0; i--) {
		if(path[i] == 'tutorials') {
			return rs;
		}
		rs += '../';
	}
	
	return 'cant-find-root/';
}

function longMachineName() {
  return "Raspberry Pi";
}

function writeLongMachineName() {
  document.write(longMachineName());
}

function mAbr() {
  return "RPi";
}

function wMAbr() {
  document.write(mAbr());
}

function mPrompt() {
  return "alarmpi";
}

function wMPrompt() {
  document.write(mPrompt());
}

function userName() {
  return "aardvarka";
}

function writeUserName() {
  document.write(userName());
}

function writeFullPrompt(dir) {
  document.write('[' + userName() + '@' + mPrompt() + ' ' + dir + ']$');
}

function processorName() {
  return "ARM Processor";
}

function writeProcessorName() {
  document.write(processorName());
}

function dns() {
  return "rpi0";
}

function wDNS() {
  document.write(dns());
}

function capitalize(arg) {
  var F = String(arg).substr(0,1).toUpperCase();
  var r = String(arg).substr(1).toLowerCase();
  return F + r;
}

function wHelpTitle(path) {
  var dir2 = capitalize(path[path.length - 3]) + "/";
  var dir1 = capitalize(path[path.length - 2]) + "/";
  var file = path[path.length - 1];
  var stem = capitalize(file.split("\.")[0]);
  document.title = dir2 + dir1 + stem;
}

function wTutorialTitle(path) {
  var dir3 = path[path.length - 4] + ": ";
  var dir1 = path[path.length - 2] + " ";
  document.title = dir3 + dir1;
}

function wTitle() {
  var path = String(document.location).split("/");
  var dir1 = path[path.length - 2];
  
  if(dir1 == "help") {
    wHelpTitle(path);
    return true;
  }
  
  if(isATutorial(dir1)) {
    wTutorialTitle(path);
    return true;
  }
	
  document.title = 'Tutorials';
}

function copyrightNotice() {
	return '<p align="center" class="copyright">'
		+ '&copy; 2013, William H. Hooper, '
		+ 'Department of Mathematics and Computer Science, Belmont University'
		+ '<br>'
    + '<a href="mailto:william.hooper@belmont.edu?subject=Usage%20Question&amp;body='
		+ 'I%20have%20a%20question%20about%20the%20page:%0D'
//		+ '%3Ca%20href=%22'
//		+ document.location
//		+ '%22%3E'
		+ document.location
//		+ '%3C/a%3E'
		+ '">'
		+ 'william.hooper@belmont.edu'
		+ '</a>'
		+ '</p>'
	;
}

function writeFooter() {
	document.write(
		copyrightNotice()
  );
}

function writeNamedTutorial(name) {
  var tA = tutorialNames();
  var link = '<a href="../' 
    + tA[name] 
    + '/instructions.html"'
    + ' target = "'
    + tA[name]
    + '"'
    + '>'
		+ 'tutorial '
		+ tA[name]
		+ '</a>';
	document.write(link);
}

function prevTutorial() {
  var path = String(document.location).split("/");
  var tN = path[path.length - 2];
  var tA = tutorialNames2();
  for(var i = 0; i < tA.length; i++) {
    if(tN == tA[i]) break;
  }
  if(i == tA.length) return '';
  if(i == 0) return 'prev';
  return '<a href="../' 
    + tA[i-1] 
    + '/instructions.html">prev</a>';
}

function nextTutorial() {
  var path = String(document.location).split("/");
  var tN = path[path.length - 2];
  var tA = tutorialNames2();
  for(var i = 0; i < tA.length; i++) {
    if(tN == tA[i]) break;
  }
  if(i == tA.length) return '';
  if(i == (tA.length - 1)) return 'next';
  return '<a href="../' 
    + tA[i+1] 
    + '/instructions.html">next</a>';
}

function wTnNavbar() {
  var ns = [
    '<p id="NavBar">',
    prevTutorial(),
	  ' | <a href="' + tutorialRoot() + 'intro.html" target="intro">intro</a>',
    ' | <a href="' + tutorialRoot() + 'help/help.html" target="help">help</a>',
    ' | <a href="./">browse</a>',
    ' | ' + nextTutorial(),
    '</p>',
  ].join('\n');
	document.write(ns);
}

function wGeneralNavbar() {
	var ns = '<p id="NavBar">';
	var first = true;
	var t = tutorialNames();
	for (var i in t) {
		if(!first) {
			ns += '\n | '
		}
		first = false;
			
		ns +='<a href="' + tutorialRoot()
		+ t[i] + '/instructions.html" target="tutorial">'
		+ t[i] + '</a>';
	}
	
	ns += '<br>\n'
	+ '<a href="' + tutorialRoot() + 'intro.html" target="intro">intro</a>\n'
	+ ' | <a href="' + tutorialRoot() + 'help/help.html" target="help">help</a>\n'
	+ ' | <a href="./">browse</a>\n'
	ns += '</p>';
	document.write(ns);
}

function wNavbar() {
	// If we already have a NavBar on this page, exit.
	// This way a custom Navigation bar overrides the default.
	try {
	  var navBar = document.getElementById("NavBar");
		if(NavBar != null) {
			return;
		}
	}
	catch(e) {	}
	
  var path = String(document.location).split("/");
  var dir = path[path.length - 2];
	
	if(isATutorial(dir)) {
		wTnNavbar();
		return;
	}
	
	wGeneralNavbar();
}
