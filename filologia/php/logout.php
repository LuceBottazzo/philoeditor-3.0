<?php
/*	
 File: logout.php
 Author: Gioia Donati, Fabio Vitali, Angelo di Iorio
 Last change on: 1/07/16



 Copyright (c) 2016, [Nome Cognome], DASPLab, Department of Computer Science, University of Bologna

    Permission to use, copy, modify, and/or distribute this software for any
    purpose with or without fee is hereby granted, provided that the above
    copyright notice and this permission notice appear in all copies.

    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
    WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
    SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
    OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
    CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

 */

		session_start() ;	
		unset($_SESSION['user']) ;
		unset($_COOKIE['user']) ;
		setcookie("user", null, 0, '/');
		echo 'logged out' ; 
?>
