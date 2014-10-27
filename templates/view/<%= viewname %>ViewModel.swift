import Foundation

class <%= viewname %>ViewModel: HDSViewModel {

    init(areasDatastore : EntityDatastore<Area>,
        venuesDatastore : EntityDatastore<Venue>
        ){
            self.areasDatastore = areasDatastore
            self.venuesDatastore = venuesDatastore
    }
}
