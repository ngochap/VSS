//
//  ChatViewController.swift
//  AppChatClone
//
//  Created by NgocHap on 20/04/2022.
//

import UIKit
import MessageKit
import InputBarAccessoryView

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}
struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate, InputBarAccessoryViewDelegate {
    
    

    let currentUser = Sender(senderId: "self", displayName: "ios Academy")
    let otherUser = Sender(senderId: "other", displayName: "ios")
    var message = [MessageType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        message.append(Message(sender: currentUser,
                               messageId: "1",
                               sentDate: Date().addingTimeInterval(-86400),
                               kind: .text("Hello world")))
        message.append(Message(sender: otherUser,
                               messageId: "2",
                               sentDate: Date().addingTimeInterval(-76400),
                               kind: .text("Hello")))
        message.append(Message(sender: currentUser,
                               messageId: "3",
                               sentDate: Date().addingTimeInterval(-66400),
                               kind: .text(" world")))
        message.append(Message(sender: otherUser,
                               messageId: "4",
                               sentDate: Date().addingTimeInterval(-56400),
                               kind: .text("Hellld")))
        message.append(Message(sender: currentUser,
                               messageId: "5", sentDate: Date().addingTimeInterval(-46400), kind: .text("He1")))
        message.append(Message(sender: otherUser,
                               messageId: "6",
                               sentDate: Date().addingTimeInterval(-36400),
                               kind: .text("Hello world2")))
        configureMessageInputBar()
    }
     func configureMessageInputBar() {
         messageInputBar.delegate = self
         messageInputBar.inputTextView.tintColor = .primaryColor
         messageInputBar.sendButton.setTitleColor(.primaryColor, for: .normal)
         messageInputBar.sendButton.setTitleColor(
             UIColor.primaryColor.withAlphaComponent(0.3),
             for: .highlighted
             )
    }
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        print("1")
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, didChangeIntrinsicContentTo size: CGSize) {
        print("2")
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, textViewTextDidChangeTo text: String) {
        print("3")
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, didSwipeTextViewWith gesture: UISwipeGestureRecognizer) {
        print("4")
    }
    func currentSender() -> SenderType {
    return currentUser
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return message[indexPath.section]
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return message.count
    }
    
}

