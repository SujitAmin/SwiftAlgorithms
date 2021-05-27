class LLNode<T> {
    var val : T;
    var next: LLNode?
    var prev : LLNode?
    
    init(_ val: T, _ next: LLNode? = nil , _ prev: LLNode? = nil) {
        self.val = val;
        self.next = next;
        self.prev = prev;
    }
}

class DoublyLinkedList<T> {
    fileprivate var head : LLNode<T>?
    fileprivate var tail : LLNode<T>?
    var isEmpty : Bool {
        return head == nil;
    }
    var count = 0;
    
    func insertAtBeginning(_ dataItem : T) {
        let node = LLNode(dataItem, head, nil);
        node.next = head;
        head?.prev = node;
        head = node;
        if tail == nil {
            tail = head;
        }
        count = count + 1;
    }
    
    func insertAtEnd(_ dataItem : T) {
        guard !isEmpty else {
            insertAtBeginning(dataItem);
            return;
        }
        let newNode = LLNode(dataItem, nil ,tail);
        tail?.next = newNode;
        tail = newNode;
        count = count + 1;
    }
    
    func removeFirst() -> T? {
        defer {
            head = head?.next;
            if isEmpty {
                head = nil;
            }
        }
        if let _ = head {
            count = count + 1;
        }
        return head?.val;
    }
    
    func removeLast() -> T? {
        guard let headValue = head else {
            return nil;
        }
        guard headValue.next != nil else {
            return removeFirst()
        }
        let current = tail;
        tail = tail?.prev
        tail?.next = nil
        count = count  - 1;
        return current?.val;
    }
}
