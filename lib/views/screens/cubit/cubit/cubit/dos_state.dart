part of 'dos_cubit.dart';

@immutable
sealed class DosState {}

final class DosInitial extends DosState {}

class Dosloading extends DosState {}

class Dossuccess extends DosState {}

class DosIerror extends DosState {}
