//
//  TransactionsListView.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import SwiftUI

struct TransactionsListView<ViewModel>: View where ViewModel: TransactionsListViewModelProtocol {
    // MARK: - Properties
    @ObservedObject private var viewModel: ViewModel
    private let connector: TransactionsListConnectorProtocol

    private let navTitle: String = "Nav_Title".localized()
    private let lastTransactionText: String = "Last_Transaction_Text".localized()
    private let allTransactionsText: String = "All_Transactions_Text".localized()
    private let generalPadding: CGFloat = 24.0
    private let normalPadding: CGFloat = 12.0
    private let smallPadding: CGFloat = 8.0
    private let circleWidthHeigth: CGFloat = 40.0
    private let rectangleLineWidth: CGFloat = 2.0
    private let dateSize: CGFloat = 12.0
    private let color: Color = .indigo

    // MARK: - Init
    init(viewModel: ViewModel, connector: TransactionsListConnectorProtocol) {
        self.viewModel = viewModel
        self.connector = connector
    }

    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text(lastTransactionText)
                        .foregroundColor(color)
                        .padding(.horizontal, smallPadding)
                    transactionRowView(transaction: viewModel.firstTransaction)
                }
                .padding(.horizontal, normalPadding)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: normalPadding)
                        .stroke(color, lineWidth: rectangleLineWidth)
                        .padding(.horizontal, smallPadding)
                        .padding(.vertical, -smallPadding)
                )

                HStack {
                    Text(allTransactionsText)
                        .foregroundColor(color)
                    Spacer()
                    Button {
                        viewModel.reverseTransactions()
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                            .foregroundColor(color)
                    }

                }
                .padding(.top, generalPadding)
                .padding(.horizontal, smallPadding)
                
                List {
                    ForEach(viewModel.transactions) { transaction in
                        transactionRowView(transaction: transaction)
                            .padding(.bottom, smallPadding)
                    }
                }
                .listStyle(.plain)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(navTitle)
            .onAppear {
                viewModel.getTransactions()
            }
        }
    }

    private func coloredCircle(isIncome: Bool) -> some View {
        Circle()
            .fill(isIncome ? Color.green : Color.red)
            .frame(width: circleWidthHeigth, height: circleWidthHeigth)
    }

    private func transactionRowView(transaction: TransactionsListItemViewModel) -> some View {
        HStack {
            coloredCircle(isIncome: transaction.isIncome)
                .padding(.trailing, smallPadding)
            VStack(alignment: .leading) {
                HStack {
                    Text("\(String(transaction.amount))€")
                    Spacer()
                    Text(transaction.date?.toDateString() ?? "")
                        .font(.system(size: dateSize))
                }
                Text(transaction.description)
            }
        }
    }
}
