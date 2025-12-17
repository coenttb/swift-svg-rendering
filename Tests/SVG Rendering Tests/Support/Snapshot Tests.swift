// Snapshot Tests.swift

import InlineSnapshotTesting
import Testing

@MainActor
@Suite(
    .serialized,
    .snapshots(record: .never)
)
struct `Snapshot Tests` {}
