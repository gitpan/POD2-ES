package POD2::ES;
use warnings;
use strict;

use utf8;
use base 'POD2::Base';

our $VERSION = '5.12.3.01_2';

my $pods = {
    perlintro   => '5.12.3',
    # perl       => '5.12.3',
    # perlbook   => '5.12.3',
    # perlcheat  => '5.12.3',
    # perldata   => '5.12.3',
    # perlfunc   => '5.12.3',
    # perlstyle  => '5.12.3',
    # perlsyn    => '5.12.3',
};


sub print_pod {
    my @args = @_ ? @_ : @ARGV;

    while (@args) {
        (my $pod = lc(shift @args)) =~ s/\.pod$//;
        if ( exists $pods->{$pod} ) {
            print "\t'$pod' traducido correspondiente a Perl $pods->{$pod}\n";
        } else {
            print "\t'$pod' no existe\n";
        }
    }
}


sub search_perlfunc_re {
    return 'Lista de funciones de Perl en orden alfab�tico';
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

pod2es es el proyecto de traducci�n al espa�ol de la documentaci�n b�sica
de Perl. Por su dimensi�n, es un proyecto a largo plazo.   

Vea L<http://github.com/zipf/perldoc-es> para obtener m�s informaci�n. 

Cuando haya instalado el paquete, puede utilizar el siguiente comando para
consultar la documentaci�n: 

  %> perldoc POD2::ES::<nombre_de_pod>

=head1 EXTENSI�N DE perldoc

Por desgracia, los �tiles modificadores C<-f> y C<-q> de C<perldoc> no
funcionan con la documentaci�n traducida.

Por esta raz�n, hemos creado una revisi�n de F<Pod/Perldoc.pm> 3.14 que
permite utilizar la siguiente sintaxis: 

  %> perldoc -L ES <nombre_pod>
  %> perldoc -L ES -f <funci�n>
  %> perldoc -L ES -q <expresi�n regular P+F>

La revisi�n agrega el modificador C<-L>, que permite definir el c�digo de
idioma para la traducci�n deseada. Si el paquete C<POD2::E<lt>idiomaE<gt>>
no existe, no se aplicar� el modificador.

Los m�s perezosos pueden agregar un alias del sistema:

  perldoc-es="perldoc -L ES "

para no tener que escribir el modificador C<-L> cada vez:

  %> perldoc-es -f map 
 
Puede aplicar la revisi�n con la l�nea siguiente: 

  %> patch -p0 `/ruta_de_perl -MPod::Perldoc -e 'print
$INC{"Pod/Perldoc.pm"}'` < /ruta/Perldoc.pm-3.14-patch

La revisi�n se incluye con esta distribuci�n y se encuentra en
F<./patches/Perldoc.pm-3.14-patch>.

Tenga en cuenta que la revisi�n es para la versi�n 3.14 de
L<Pod::Perldoc|Pod::Perldoc>
(incluida en Perl 5.8.7 y en Perl 5.8.8). Si tiene una distribuci�n de Perl
anterior
(salvo la E<gt>= 5.8.1) y est� impaciente por aplicar la revisi�n,
actualice el m�dulo L<Pod::Perldoc|Pod::Perldoc> a la versi�n 3.14.   

Consulte la API C<search_perlfunc_re> para obtener m�s informaci�n.

I<Nota: Perl 5.10 ya contiene esta funcionalidad, por lo que no es
necesario aplicar la revisi�n.>

=head1 API

El paquete exporta las siguientes funciones:

=over 4

=item * C<new>

Se ha agregado por compatibilidad con la funci�n C<perldoc> de Perl 5.10.1.
L<Pod::Perldoc> la utiliza para devolver el nombre del paquete de
traducci�n.

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

Como el m�todo C<search_perlfunc> de F<Pod/Perldoc.pm> utiliza la cadena
"Lista de funciones de Perl en orden alfab�tico" incluida en el c�digo
(como una expresi�n regular) para omitir la introducci�n, a fin de que el
archivo de revisi�n funcione con otros idiomas con la opci�n C<-L>, hemos
utilizado un mecanismo sencillo, similar a un complemento. 

El paquete de idioma C<POD2::E<lt>idiomaE<gt>> debe exportar
C<search_perlfunc_re> para devolver una traducci�n de la cadena mencionada
en el p�rrafo anterior. Esta cadena se usar� para omitir la introducci�n de
F<perlfunc.pod>. Si 
C<POD2::E<lt>idiomaE<gt>-E<gt>search_perlfunc_re> genera un error (o no
existe), se restablece el comportamiento predeterminado. Este mecanismo
permite agregar traducciones de C<POD2::*> adicionales sin necesidad de
aplicar cada vez la revisi�n de F<Pod/Perldoc.pm>.

=back

=head1 PROYECTO

Encontrar� m�s informaci�n sobre el proyecto en
L<http://github.com/zipf/perldoc-es>.

=head1 AUTORES

=item * Joaqu�n Ferrero  C< explorer at joaquinferrero.com >
=item * Enrique Nell  C< blas.gordon at gmail.com E<gt >


=head1 VEA TAMBI�N

L<POD2::PT_BR>, L<POD2::IT>, L<POD2::FR>, L<POD2::LT>, L<perl>.


=head1 ERRORES

Puede notificar errores (bugs) o solicitar funcionalidad a trav�s de la
direcci�n de correo electr�nico C<bug-pod2-esd at rt.cpan.org> o de la
interfaz web en L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=POD2-ES>. 
Se le comunicar�n autom�ticamente los cambios relacionados con los errores
notificados o la funcionalidad solicitada.


=head1 ASISTENCIA

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


=head1 LICENCIA Y COPYRIGHT

Copyright 2011 Equipo de Perl en Espa�ol.

Este programa es software libre; puede redistribuirlo o modificarlo bajo
los t�rminos de la licencia GNU General Public License publicada por la
Free Software Foundation, o los de la licencia Artistic.

Consulte http://dev.perl.org/licenses/ para obtener m�s informaci�n.


=cut
