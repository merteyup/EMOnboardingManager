//
//  CapsulePickerView.swift
//  EMOnboardingManager
//
//  Created by Eyüp Mert on 2.06.2025.
//

import SwiftUI

struct CapsulePickerView: UIViewControllerRepresentable {
    let items: [String]
    @Binding var selectedItems: Set<String>

    func makeUIViewController(context: Context
    ) -> CapsuleCollectionViewController {
        let vc = CapsuleCollectionViewController()
        vc.items = items
        vc.selectedItems = selectedItems
        vc.onSelectionChanged = { newSelection in
            selectedItems = newSelection
        }
        return vc
    }
    
    func updateUIViewController(_ uiViewController: CapsuleCollectionViewController,
                                context: Context) {
        uiViewController.items = items
        uiViewController.selectedItems = selectedItems
    }
}

final class CapsuleCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "CapsuleCell"
    
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor.systemGray5
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .label
        label.textAlignment = .center
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        ])
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func configure(with text: String, isSelected: Bool) {
        label.text = text
        contentView.backgroundColor = isSelected ? UIColor.systemBlue : UIColor.systemGray5
        label.textColor = isSelected ? .white : .label
    }
}

final class CapsuleCollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var items: [String] = []
    var selectedItems: Set<String> = []
    var onSelectionChanged: ((Set<String>) -> Void)?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = Paddings.mid
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CapsuleCollectionViewCell.self, forCellWithReuseIdentifier: CapsuleCollectionViewCell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.item]
        let isSelected = selectedItems.contains(item)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CapsuleCollectionViewCell.reuseIdentifier, for: indexPath) as! CapsuleCollectionViewCell
        cell.configure(with: item, isSelected: isSelected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.item]
        
        if selectedItems.contains(item) {
            selectedItems.remove(item)
        } else {
            selectedItems.insert(item)
        }
        
        onSelectionChanged?(selectedItems)
        collectionView.reloadItems(at: [indexPath])
    }
}
