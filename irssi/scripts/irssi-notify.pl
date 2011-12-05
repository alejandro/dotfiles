use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '0.1.1';
%IRSSI = (
        authors     => 'Alejandro Morales Gámez',
        contact     => 'alejandromg@gmail.com',
        name        => 'notify-me',
        description => 'Display a pop-up alert for different events.',
        url         => 'http://alejandromorales.co.cc',
        license     => 'GNU General Public License',
        changed     => '$Date: 2011-12-05 00:46:00 -0600 $'
);

#--------------------------------------------------------------------
# @author: Alejandro Morales
# Dic 5, 2011
#--------------------------------------------------------------------
my $notify_nick = 'alejandromg';

sub pub_msg {
        my ($server,$msg,$nick,$address,$room) = @_;
        if ($msg =~ $notify_nick) 
        {
        `notify-send -t 8000 --icon=gtk-home "${room}" "${nick}: ${msg}"`;  
        }
}
sub priv_msg {
        my ($method,$msg,$dude,$server) = @_;
        `notify-send -t 8000 --icon=gtk-home "MSG DIRECT" "${dude}:: ${msg}"`;
}
sub cmd_notifyon {
    my $nick = shift;
    if(!$nick)
    {
      	Irssi::print("Current notification nick is $notify_nick .");
    }
    else
    {
      	$notify_nick = $nick;
        Irssi::print("Notification nick has changed now is: $notify_nick .");
    }
}


#--------------------------------------------------------------------
# Irssi::signal_add_last / Irssi::command_bind
#--------------------------------------------------------------------
Irssi::command_bind('notify-on', "cmd_notifyon");
Irssi::signal_add_last('message private', "priv_msg");
Irssi::signal_add_last("message public", "pub_msg");
#- end
