package POD2::ES;
use warnings;
use strict;

use base 'POD2::Base';

our $VERSION = '5.14.1.05';

sub search_perlfunc_re {
    return 'Lista de funciones de Perl en orden alfab�tico';
}

sub pod_info {{
    perl        => '5.14.1',
    perlbook    => '5.14.1',
    perlcheat   => '5.14.1',
    #perldata    => '5.14.1',
    perlfaq1    => '5.14.1',
    perlfaq2    => '5.14.1',
    perlintro   => '5.14.1',
    perlnumber  => '5.14.1',
    perlunitut  => '5.14.1',
    perlutil    => '5.14.1',
    'README.freebsd'  => '5.14.1',
    'README.openbsd'  => '5.14.1',
    # perlfunc   => '5.14.1',
    # perlstyle  => '5.14.1',
    # perlsyn    => '5.14.1',
}};

sub print_pod {
    my $self = shift;
    my @args = @_ ? @_ : @ARGV;

    my $pods = $self->pod_info;
    while (@args) {
        (my $pod = lc(shift @args)) =~ s/\.pod$//;
        if ( exists $pods->{$pod} ) {
            print "\t'$pod' traducido correspondiente a Perl $pods->{$pod}\n";
        }
        else {
            print "\t'$pod' todav�a no existe\n";
        }
    }
}

1;

__END__

=head1 NOMBRE

POD2::ES - Documentaci�n de Perl en espa�ol

=head1 SINOPSIS

  %> perldoc POD2::ES::<nombre_de_pod>	

  use POD2::ES;
  print_pods();
  print_pod('pod_foo', 'pod_baz', ...); 

  %> perl -MPOD2::ES -e print_pods
  %> perl -MPOD2::ES -e print_pod <nombre_de_pod1> <nombre_de_pod2> ...

=head1 DESCRIPCI�N

pod2es es el proyecto de traducci�n al espa�ol de la documentaci�n b�sica de
Perl. Por su dimensi�n, es un proyecto a largo plazo.

Vea L<http://github.com/zipf/perldoc-es> para obtener m�s informaci�n.

Cuando haya instalado el paquete, puede utilizar el siguiente comando para
consultar la documentaci�n:

  %> perldoc POD2::ES::<nombre_de_pod>

=head1 ACTUALIZACI�N DE perldoc

Por desgracia, los �tiles modificadores C<-f> y C<-q> de C<perldoc> no
funcionan con la documentaci�n traducida.

Por esta raz�n, a partir de la versi�n 3.14 de Pod::Perldoc se permite utilizar
la siguiente sintaxis:

  %> perldoc -L ES <nombre_pod>
  %> perldoc -L ES -f <funci�n>
  %> perldoc -L ES -q <expresi�n regular P+F>

El modificador C<-L> permite definir el c�digo de idioma para la traducci�n
deseada. Si el paquete C<POD2::E<lt>idiomaE<gt>> no existe, no se aplicar� el
modificador.

Los m�s perezosos pueden agregar un alias del sistema:

  perldoc-es="perldoc -L ES "

para no tener que escribir el modificador C<-L> cada vez:

  %> perldoc-es -f map 
 
Con la versi�n 3.15 de Pod::Perldoc se puede usar la variable de entorno
PERLDOC_POD2. Si se establece esta variable en '1', perldoc buscar� en la
documentaci�n pod seg�n el idioma indicado en las variables LC_ALL, LC_LANG o
LANG. O bien, se puede establecer en el valor 'es', con lo que buscar�
directamente en la documentaci�n en espa�ol. Por ejemplo:

       export PERLDOC_POD2="es"
       perldoc perl


Tenga en cuenta que la revisi�n es para la versi�n 3.14 de
L<Pod::Perldoc|Pod::Perldoc> (incluida en Perl 5.8.7 y en Perl 5.8.8). Si tiene
una distribuci�n de Perl anterior (salvo la E<gt>= 5.8.1) y est� impaciente por
aplicar la revisi�n, actualice el m�dulo L<Pod::Perldoc|Pod::Perldoc> a la
versi�n 3.14. Perl 5.10 ya contiene esta funcionalidad, por lo que no es
necesario aplicar la revisi�n.

Consulte la API C<search_perlfunc_re> para obtener m�s informaci�n.


=head1 API

El paquete exporta las siguientes funciones:

=over 4

=item * C<new>

Se ha agregado por compatibilidad con la funci�n C<perldoc> de Perl 5.10.1.
L<Pod::Perldoc> la utiliza para devolver el nombre del paquete de traducci�n.

=item * C<pod_dirs>

Se ha agregado por compatibilidad con la funci�n C<perldoc> de Perl 5.10.1.
L<Pod::Perldoc> la utiliza para determinar d�nde debe buscar los pods
traducidos.

=item * C<print_pods>

Imprime en pantalla todos los pods traducidos y la versi�n original de Perl
correspondiente.

=item * C<print_pod>

Imprime en pantalla la versi�n original de Perl correspondiente a todos los
pods pasados como argumentos.

=item * C<search_perlfunc_re>

Como el m�todo C<search_perlfunc> de F<Pod/Perldoc.pm> utiliza la cadena "Lista
de funciones de Perl en orden alfab�tico" incluida en el c�digo (como una
expresi�n regular) para omitir la introducci�n, a fin de que el archivo de
revisi�n funcione con otros idiomas con la opci�n C<-L>, hemos utilizado un
mecanismo sencillo, similar a un complemento.

El paquete de idioma C<POD2::E<lt>idiomaE<gt>> debe exportar
C<search_perlfunc_re> para devolver una traducci�n de la cadena mencionada en
el p�rrafo anterior. Esta cadena se usar� para omitir la introducci�n de
F<perlfunc.pod>. Si C<POD2::E<lt>idiomaE<gt>-E<gt>search_perlfunc_re> genera un
error (o no existe), se restablece el comportamiento predeterminado. Este
mecanismo permite agregar traducciones de C<POD2::*> adicionales sin necesidad
de aplicar cada vez la revisi�n de F<Pod/Perldoc.pm>.

=back

=head1 PROYECTO

Encontrar� m�s informaci�n sobre el proyecto en
L<http://github.com/zipf/perldoc-es>.

=head1 AUTORES

=over

=item * Joaqu�n Ferrero (Tech Lead), C< explorer + POD2ES at joaquinferrero.com >

=item * Enrique Nell (Language Lead), C< blas.gordon + POD2ES at gmail.com >

=back

=head1 NOTAS SOBRE LA TRADUCCI�N

Para este proyecto hemos tomado las siguientes decisiones:

=over

=item * No utilizar caracteres acentuados en los nombres de variables y
funciones de los ejemplos de c�digo

Es perfectamente posible utilizarlos (solo hay que codificar el programa como
UTF-8 y agregar "use utf8;" al principio), pero teniendo en mente a ese
programador m�s impulsivo, que valora su tiempo y no quiere perderse en
reflexiones ni verse encorsetado por las normas de la lengua, creemos que as�
resultar� m�s f�cil probar el c�digo de los ejemplos.

Por otra parte, en aquellos sistemas que cuenten con un sistema antiguo de
visualizaci�n de texto, como los terminales de l�nea de comandos, es posible
que se pierdan los acentos. En la mayor parte de los casos ser� debido a la
presencia de una versi�n de groff (programa utilizado por los comandos man y
perldoc) que no admite dichos caracteres. En la documentaci�n HTML no deber�a
haber problemas.


=item * No traducir los t�rminos "array" y "hash"

Si tenemos en cuenta que Perl tiene m�s de 20 a�os y que la inmensa mayor�a de
los libros disponibles sobre este lenguaje est�n en ingl�s, a nadie extra�ar�
que la comunidad de habla hispana se refiera a estos tipos de datos por su
nombre en ingl�s. Existen posibles traducciones, como "matriz", "lista" o
"arreglo" para "array", o "diccionario" para "hash", pero su uso no se ha
extendido, por lo que hemos preferido utilizar su nombre original. Creemos que
esto facilitar� la lectura de la documentaci�n.


=item * Utilizar "espa�ol neutro"

El "espa�ol neutro" es un espa�ol controlado que pretende evitar el uso de
t�rminos ofensivos o de construcciones poco frecuentes en determinados pa�ses
de habla hispana, con el objetivo de lograr traducciones v�lidas para Espa�a y
Latinoam�rica.

=back


=head1 VEA TAMBI�N

L<POD2::PT_BR>, L<POD2::IT>, L<POD2::FR>, L<POD2::LT>, L<perl>.


=head1 ERRORES

Puede notificar errores (bugs) o solicitar funcionalidad a trav�s de la
direcci�n de correo electr�nico C<bug-pod2-esd at rt.cpan.org> o de la interfaz
web en L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=POD2-ES>. Se le
comunicar�n autom�ticamente los cambios relacionados con los errores
notificados o la funcionalidad solicitada.


=head1 SOPORTE

Para ver la documentaci�n de este m�dulo, utilice el comando perldoc.

    perldoc POD2::ES


Tambi�n puede buscar informaci�n en:

=over 4

=item * RT: sistema de seguimiento de solicitudes de CPAN

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=POD2-ES>

=item * AnnoCPAN: documentaci�n de CPAN anotada

L<http://annocpan.org/dist/POD2-ES>

=item * Valoraciones de CPAN

L<http://cpanratings.perl.org/d/POD2-ES>

=item * B�squeda de m�dulos de CPAN

L<http://search.cpan.org/dist/POD2-ES/>

=back


=head1 AGRADECIMIENTOS

Los autores desean expresar su gratitud al equipo de desarrollo de OmegaT, la
herramienta utilizada para la traducci�n.


=head1 REFERENCIAS

Proyecto OmegaT: L<http://omegat.org/>


=head1 DONATIVOS

Por el elevado volumen de trabajo que representa y su larga duraci�n, el
proyecto de traducci�n de la documentaci�n de Perl requiere un esfuerzo
sostenido que s�lo est� al alcance de los esp�ritus m�s s�lidos y altruistas.
Los autores no exigen--pero tampoco rechazar�n--compensaciones en forma de
dinero, libros, quesos y productos derivados del cerdo (o chancho), o incluso
viajes a la Polinesia, destinadas a reducir la fatiga del equipo y a mantener
alta la moral. Todo ser� bienvenido.


=head1 LICENCIA Y COPYRIGHT

Copyright 2011 Equipo de Perl en Espa�ol.

Este programa es software libre; puede redistribuirlo o modificarlo bajo los
t�rminos de la licencia GNU General Public License publicada por la Free
Software Foundation, o los de la licencia Artistic.

Consulte http://dev.perl.org/licenses/ para obtener m�s informaci�n.


=cut
