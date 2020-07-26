import UIKit

final class SnoozeViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    // reference to alertManager
    private var alertManager:AlertManager?
    
    // MARK: - Public functions
    
    public func configure(alertManager:AlertManager?) {
        self.alertManager = alertManager
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Texts_Alerts.alertsScreenTitle
        setupView()
    }
    
    // MARK: - private helper functions
    
    // setup the view
    private func setupView() {
        setupTableView()
    }
    
    /// setup datasource, delegate, seperatorInset
    private func setupTableView() {
        if let tableView = tableView {
            // insert slightly the separator text so that it doesn't touch the safe area limit
            tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            tableView.dataSource = self
            tableView.delegate = self
            
        }
    }
    
}

extension SnoozeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.reuseIdentifier, for: indexPath) as? SettingsTableViewCell else { fatalError("Unexpected Table View Cell") }
        
        cell.textLabel?.text = "cell number " + indexPath.row.description
        
        // no detail text to be shown
        cell.detailTextLabel?.text = nil
        
        // clicking the cell will always open a new screen which allows the user to edit the alert type
        cell.accessoryType = .none
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "section " + section.description
        
    }

}

extension SnoozeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}
