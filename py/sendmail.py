#!/usr/bin/python

import smtplib

sender = 'v.mingchen@gmail.com'
receivers = ['v.mingchen@gmail.com']

message = """From: Ming Chen <mchen@cs.stonybrook.edu>
To: Ming <v.mingchen@gmail.com>
Subject: Waiting-List Ready

This is a test e-mail message.
"""

try:
	smtpObj = smtplib.SMTP('smtp.gmail.com', 587)
	smtpObj.ehlo()
	smtpObj.starttls()
	smtpObj.ehlo()
	smtpObj.login(sender,'mypassword')
	smtpObj.sendmail(sender, receivers, message)         
	print "Successfully sent email"
except smtplib.SMTPException:
	print "Error: unable to send email"
