package logger

import "time"

type AuditLogInfoType struct {
	CreatedBy        string    `bson:"created_by,omitempty"`
	CreatedById      string    `bson:"created_by_id,omitempty"`
	CreatedDateTime  time.Time `bson:"created_datetime,omitempty"`
	ModifiedBy       string    `bson:"modified_by,omitempty"`
	ModifiedById     string    `bson:"modified_by_id,omitempty"`
	ModifiedDateTime time.Time `bson:"modified_datetime,omitempty"`
}

type BaseAuditLog struct {
	EventType    string                 `bson:"event_type"`
	RefId        string                 `bson:"ref_id"`
	Data         map[string]interface{} `bson:"data"`
	RecordType   string                 `bson:"record_type"`
	AuditLogInfo AuditLogInfoType       `bson:"audit_log_info"`
}
