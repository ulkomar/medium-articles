import UIKit

protocol MainBusinessLogic {
    func fetchCartoonCharacters(request: Main.displayCartoonCharacters.Request)
    func saveSelectedItem(character: Main.displayCartoonCharacters.ViewModel.characterInformationModel)
}

protocol MainDataStore {
    var chosenCharacter: CharResult? { get set }
}

class MainInteractor: MainBusinessLogic, MainDataStore {
    
    var presenter: MainPresentationLogic?
    var worker: MainWorker?
    var characters: [CharResult] = []
    var chosenCharacter: CharResult?
    private let network = Network()
    
    // MARK: class functions
    
    func fetchCartoonCharacters(request: Main.displayCartoonCharacters.Request) {
        network.fatchCharacters { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    let characters = result.results
                    self?.characters = characters
                    let response = Main.displayCartoonCharacters.Response(characters: characters)
                    self?.presenter?.presentFetchedCartoonCharacters(response: response)
                case .failure(let failure):
                    // Здесь можно как-то обработать ошибку
                    print(failure)
                }
            }
        }
    }
    
    func saveSelectedItem(character: Main.displayCartoonCharacters.ViewModel.characterInformationModel) {
        for characterItem in characters {
            if characterItem.id == character.id {
                chosenCharacter = characterItem
                break
            }
        }
    }
}





