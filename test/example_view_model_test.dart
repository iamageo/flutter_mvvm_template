import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_mvvm_template/remote/model/base_model.dart';
import 'package:flutter_mvvm_template/remote/response/api_response.dart';
import 'package:flutter_mvvm_template/ui/controller/example_view_model.dart';
import 'mocks.mocks.dart';

void main() {
  late MockAppRepository mockRepository;
  late ExampleViewModel viewModel;

  setUp(() {
    mockRepository = MockAppRepository();
    viewModel = ExampleViewModel(api: mockRepository);
    viewModel.getResponse.value = const ApiResponse.loading();
  });

  test(
    'Quando getDataExample retorna sucesso, getResponse.value deve ser Success com a lista',
        () async {

      final listaFake = <BaseModel>[
        BaseModel(id: 1, title: 'Título 1', body: 'Corpo 1'),
        BaseModel(id: 2, title: 'Título 2', body: 'Corpo 2'),
      ];

      when(mockRepository.getDataExample())
          .thenAnswer((_) async => ApiResponse.success(data: listaFake));

      await viewModel.getPosts();

      final estado = viewModel.getResponse.value;
      expect(estado, isA<Success<List<BaseModel>>>());

      if (estado is Success<List<BaseModel>>) {
        expect(estado.data, listaFake);
        expect(estado.data.length, 2);
        expect(estado.data[0].title, 'Título 1');
      }
    },
  );

  test(
    'Quando getDataExample retorna erro, getResponse.value deve ser Error com mensagem',
        () async {

      const msgErro = 'Falha de rede';

      when(mockRepository.getDataExample())
          .thenAnswer((_) async => const ApiResponse.error(message: msgErro));

      await viewModel.getPosts();

      final estado = viewModel.getResponse.value;
      expect(estado, isA<Error<List<BaseModel>>>());

      if (estado is Error<List<BaseModel>>) {
        expect(estado.message, msgErro);
      }
    },
  );

}
