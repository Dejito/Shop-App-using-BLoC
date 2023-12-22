import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(  const SignInState(email: "", password: "")) {
    on<EmailEvent>((event, emit){
      state.copyWith(email: event.email);
    });
    on<PasswordEvent>((event, emit){
      state.copyWith(password: event.password);
    });
  }
}
